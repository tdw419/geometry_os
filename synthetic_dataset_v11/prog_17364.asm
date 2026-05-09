; DESCRIPTION: Places a cyan 75x104 rectangle at position (146, 57).
; PLAN: r0=146(x), r1=57(y), r2=75(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 57
LDI r2, 75
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
