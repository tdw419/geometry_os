; DESCRIPTION: Places a cyan 50x108 rectangle at position (146, 50).
; PLAN: r0=146(x), r1=50(y), r2=50(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 50
LDI r2, 50
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
