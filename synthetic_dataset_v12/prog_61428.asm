; DESCRIPTION: Renders a green box of size 104x20 starting at (395, 125).
; PLAN: r0=395(x), r1=125(y), r2=104(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 125
LDI r2, 104
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
