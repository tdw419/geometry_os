; DESCRIPTION: Places a cyan 120x94 rectangle at position (326, 83).
; PLAN: r0=326(x), r1=83(y), r2=120(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 83
LDI r2, 120
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
