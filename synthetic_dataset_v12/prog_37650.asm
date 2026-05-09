; DESCRIPTION: Places a yellow 50x19 rectangle at position (208, 119).
; PLAN: r0=208(x), r1=119(y), r2=50(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 119
LDI r2, 50
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
