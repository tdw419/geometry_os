; DESCRIPTION: Places a cyan 106x111 box at position (63, 42).
; PLAN: r0=63(x), r1=42(y), r2=106(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 42
LDI r2, 106
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
