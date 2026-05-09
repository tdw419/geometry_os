; DESCRIPTION: Places a cyan 105x57 rectangle at position (271, 50).
; PLAN: r0=271(x), r1=50(y), r2=105(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 50
LDI r2, 105
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
