; DESCRIPTION: Places a yellow 75x79 box at position (215, 95).
; PLAN: r0=215(x), r1=95(y), r2=75(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 95
LDI r2, 75
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
