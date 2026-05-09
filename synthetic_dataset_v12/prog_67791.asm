; DESCRIPTION: Places a cyan 120x64 rectangle at position (245, 127).
; PLAN: r0=245(x), r1=127(y), r2=120(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 127
LDI r2, 120
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
