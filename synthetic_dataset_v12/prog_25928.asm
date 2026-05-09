; DESCRIPTION: Renders a cyan disk with center (443, 213) and radius 42.
; PLAN: r0=443(x), r1=213(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 213
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
