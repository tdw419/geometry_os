; DESCRIPTION: Places a cyan 32x85 rectangle at position (146, 171).
; PLAN: r0=146(x), r1=171(y), r2=32(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 171
LDI r2, 32
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
