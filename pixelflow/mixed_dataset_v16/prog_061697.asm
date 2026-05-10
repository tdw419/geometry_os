; DESCRIPTION: Places a yellow 60x57 box at position (215, 186).
; PLAN: r0=215(x), r1=186(y), r2=60(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 186
LDI r2, 60
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
