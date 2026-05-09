; DESCRIPTION: Renders a purple box of size 86x24 starting at (215, 229).
; PLAN: r0=215(x), r1=229(y), r2=86(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 229
LDI r2, 86
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
