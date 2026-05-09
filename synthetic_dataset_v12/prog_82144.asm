; DESCRIPTION: Places a red 93x51 rectangle at position (269, 55).
; PLAN: r0=269(x), r1=55(y), r2=93(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 55
LDI r2, 93
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
