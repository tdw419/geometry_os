; DESCRIPTION: Places a cyan 65x64 rectangle at position (407, 125).
; PLAN: r0=407(x), r1=125(y), r2=65(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 125
LDI r2, 65
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
