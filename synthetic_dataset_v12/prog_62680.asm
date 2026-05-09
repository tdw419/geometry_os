; DESCRIPTION: Places a cyan 42x116 rectangle at position (214, 133).
; PLAN: r0=214(x), r1=133(y), r2=42(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 133
LDI r2, 42
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
