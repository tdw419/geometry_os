; DESCRIPTION: Places a red 98x58 rectangle at position (295, 119).
; PLAN: r0=295(x), r1=119(y), r2=98(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 119
LDI r2, 98
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
