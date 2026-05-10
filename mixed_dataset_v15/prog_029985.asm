; DESCRIPTION: Renders a white box of size 120x77 starting at (176, 50).
; PLAN: r0=176(x), r1=50(y), r2=120(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 50
LDI r2, 120
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
