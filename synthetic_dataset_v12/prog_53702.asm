; DESCRIPTION: Renders a white box of size 72x20 starting at (46, 200).
; PLAN: r0=46(x), r1=200(y), r2=72(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 200
LDI r2, 72
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
