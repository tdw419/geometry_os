; DESCRIPTION: Places a cyan 57x42 rectangle at position (125, 51).
; PLAN: r0=125(x), r1=51(y), r2=57(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 51
LDI r2, 57
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
