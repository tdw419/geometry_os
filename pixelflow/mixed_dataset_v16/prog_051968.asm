; DESCRIPTION: Places a yellow 35x50 rectangle at position (295, 165).
; PLAN: r0=295(x), r1=165(y), r2=35(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 165
LDI r2, 35
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
