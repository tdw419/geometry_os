; DESCRIPTION: Places a black 60x17 rectangle at position (317, 220).
; PLAN: r0=317(x), r1=220(y), r2=60(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 220
LDI r2, 60
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
