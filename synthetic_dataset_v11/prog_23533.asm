; DESCRIPTION: Places a cyan 31x64 rectangle at position (150, 150).
; PLAN: r0=150(x), r1=150(y), r2=31(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 150
LDI r2, 31
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
