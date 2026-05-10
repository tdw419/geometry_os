; DESCRIPTION: Places a green 101x16 box at position (146, 193).
; PLAN: r0=146(x), r1=193(y), r2=101(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 193
LDI r2, 101
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
