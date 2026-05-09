; DESCRIPTION: Places a red 112x55 rectangle at position (73, 120).
; PLAN: r0=73(x), r1=120(y), r2=112(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 120
LDI r2, 112
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
