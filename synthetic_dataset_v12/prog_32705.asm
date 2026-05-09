; DESCRIPTION: Renders a white box of size 44x77 starting at (372, 169).
; PLAN: r0=372(x), r1=169(y), r2=44(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 169
LDI r2, 44
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
