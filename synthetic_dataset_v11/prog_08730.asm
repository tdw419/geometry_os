; DESCRIPTION: Places a magenta 46x66 rectangle at position (39, 143).
; PLAN: r0=39(x), r1=143(y), r2=46(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 143
LDI r2, 46
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
