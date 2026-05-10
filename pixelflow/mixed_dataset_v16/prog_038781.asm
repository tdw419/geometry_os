; DESCRIPTION: Places a cyan 99x26 rectangle at position (271, 198).
; PLAN: r0=271(x), r1=198(y), r2=99(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 198
LDI r2, 99
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
