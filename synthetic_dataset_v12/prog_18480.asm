; DESCRIPTION: Places a yellow 120x54 rectangle at position (50, 149).
; PLAN: r0=50(x), r1=149(y), r2=120(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 149
LDI r2, 120
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
