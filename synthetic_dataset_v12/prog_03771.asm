; DESCRIPTION: Renders a cyan box of size 42x32 starting at (262, 164).
; PLAN: r0=262(x), r1=164(y), r2=42(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 164
LDI r2, 42
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
