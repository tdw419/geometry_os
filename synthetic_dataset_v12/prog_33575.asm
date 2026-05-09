; DESCRIPTION: Renders a green box of size 111x109 starting at (295, 74).
; PLAN: r0=295(x), r1=74(y), r2=111(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 74
LDI r2, 111
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
