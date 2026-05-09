; DESCRIPTION: Renders a cyan box of size 93x42 starting at (130, 103).
; PLAN: r0=130(x), r1=103(y), r2=93(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 103
LDI r2, 93
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
