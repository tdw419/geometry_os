; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (204, 82). Then Places a cyan 82x38 rectangle at position (16, 50).
; PLAN: r0=204(x), r1=82(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=16(x), r1=50(y), r2=82(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (204, 82).
; PLAN: r0=204(x), r1=82(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 82
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a cyan 82x38 rectangle at position (16, 50).
; PLAN: r0=16(x), r1=50(y), r2=82(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 50
LDI r2, 82
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
