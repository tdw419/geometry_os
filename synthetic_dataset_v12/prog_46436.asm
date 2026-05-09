; DESCRIPTION: Renders a green box of size 111x103 starting at (240, 103).
; PLAN: r0=240(x), r1=103(y), r2=111(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 103
LDI r2, 111
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
