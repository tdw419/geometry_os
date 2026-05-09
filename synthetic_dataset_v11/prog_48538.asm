; DESCRIPTION: Places a cyan 92x30 rectangle at position (73, 132).
; PLAN: r0=73(x), r1=132(y), r2=92(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 132
LDI r2, 92
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
