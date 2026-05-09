; DESCRIPTION: Places a magenta 71x116 rectangle at position (79, 109).
; PLAN: r0=79(x), r1=109(y), r2=71(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 109
LDI r2, 71
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
