; DESCRIPTION: Places a white 82x93 box at position (140, 27).
; PLAN: r0=140(x), r1=27(y), r2=82(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 27
LDI r2, 82
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
