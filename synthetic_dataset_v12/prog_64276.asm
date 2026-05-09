; DESCRIPTION: Places a red 65x24 rectangle at position (4, 120).
; PLAN: r0=4(x), r1=120(y), r2=65(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 120
LDI r2, 65
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
