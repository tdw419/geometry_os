; DESCRIPTION: Places a cyan 48x13 box at position (220, 152).
; PLAN: r0=220(x), r1=152(y), r2=48(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 152
LDI r2, 48
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
