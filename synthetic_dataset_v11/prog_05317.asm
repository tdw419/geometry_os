; DESCRIPTION: Composite: . Then Places a white dot at position (40, 26). Then Places a blue 54x73 rectangle at position (42, 57).
; PLAN: r0=40(x), r1=26(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=42(x), r1=57(y), r2=54(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (40, 26).
; PLAN: r0=40(x), r1=26(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 26
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a blue 54x73 rectangle at position (42, 57).
; PLAN: r0=42(x), r1=57(y), r2=54(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 57
LDI r2, 54
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
