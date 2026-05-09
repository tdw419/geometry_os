; DESCRIPTION: Renders a cyan box of size 14x24 starting at (195, 213).
; PLAN: r0=195(x), r1=213(y), r2=14(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 213
LDI r2, 14
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
