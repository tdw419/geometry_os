; DESCRIPTION: Places a yellow 35x92 rectangle at position (50, 143).
; PLAN: r0=50(x), r1=143(y), r2=35(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 143
LDI r2, 35
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
