; DESCRIPTION: Places a cyan 98x44 rectangle at position (287, 142).
; PLAN: r0=287(x), r1=142(y), r2=98(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 142
LDI r2, 98
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
