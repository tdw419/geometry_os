; DESCRIPTION: Renders a yellow box of size 34x14 starting at (195, 213).
; PLAN: r0=195(x), r1=213(y), r2=34(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 213
LDI r2, 34
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
