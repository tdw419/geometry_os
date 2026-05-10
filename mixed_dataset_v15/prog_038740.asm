; DESCRIPTION: Places a cyan 71x64 box at position (109, 150).
; PLAN: r0=109(x), r1=150(y), r2=71(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 150
LDI r2, 71
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
