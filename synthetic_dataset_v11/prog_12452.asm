; DESCRIPTION: Places a cyan 60x47 rectangle at position (168, 80).
; PLAN: r0=168(x), r1=80(y), r2=60(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 80
LDI r2, 60
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
