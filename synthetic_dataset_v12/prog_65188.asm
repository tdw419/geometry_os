; DESCRIPTION: Places a yellow 37x36 rectangle at position (317, 210).
; PLAN: r0=317(x), r1=210(y), r2=37(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 210
LDI r2, 37
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
