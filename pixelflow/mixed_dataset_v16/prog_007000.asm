; DESCRIPTION: Places a red 106x26 rectangle at position (185, 143).
; PLAN: r0=185(x), r1=143(y), r2=106(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 143
LDI r2, 106
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
