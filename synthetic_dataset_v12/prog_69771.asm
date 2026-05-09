; DESCRIPTION: Places a cyan 22x36 rectangle at position (131, 213).
; PLAN: r0=131(x), r1=213(y), r2=22(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 213
LDI r2, 22
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
