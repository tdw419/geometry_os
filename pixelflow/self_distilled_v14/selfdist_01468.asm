; DESCRIPTION: Places a red 52x64 box at position (202, 61).
; PLAN: r0=202(x), r1=61(y), r2=52(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 61
LDI r2, 52
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
