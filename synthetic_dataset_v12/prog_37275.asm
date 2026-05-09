; DESCRIPTION: Places a cyan 13x50 rectangle at position (307, 161).
; PLAN: r0=307(x), r1=161(y), r2=13(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 161
LDI r2, 13
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
