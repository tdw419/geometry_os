; DESCRIPTION: Places a green 95x115 box at position (391, 173).
; PLAN: r0=391(x), r1=173(y), r2=95(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 173
LDI r2, 95
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
