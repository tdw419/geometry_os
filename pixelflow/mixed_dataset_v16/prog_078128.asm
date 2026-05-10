; DESCRIPTION: Places a magenta 47x29 rectangle at position (146, 223).
; PLAN: r0=146(x), r1=223(y), r2=47(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 223
LDI r2, 47
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
