; DESCRIPTION: Places a magenta 120x19 rectangle at position (321, 223).
; PLAN: r0=321(x), r1=223(y), r2=120(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 223
LDI r2, 120
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
