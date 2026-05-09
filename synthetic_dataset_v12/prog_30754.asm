; DESCRIPTION: Places a cyan 82x64 rectangle at position (293, 121).
; PLAN: r0=293(x), r1=121(y), r2=82(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 121
LDI r2, 82
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
