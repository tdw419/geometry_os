; DESCRIPTION: Places a white 115x68 rectangle at position (301, 143).
; PLAN: r0=301(x), r1=143(y), r2=115(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 143
LDI r2, 115
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
