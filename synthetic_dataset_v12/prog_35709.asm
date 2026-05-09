; DESCRIPTION: Places a cyan 54x36 rectangle at position (220, 43).
; PLAN: r0=220(x), r1=43(y), r2=54(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 43
LDI r2, 54
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
